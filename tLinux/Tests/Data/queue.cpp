#include <boost/test/unit_test.hpp>
#include "Data/queue.h"
#include <cstring>

typedef unsigned Type;
static const Type init_val = 0x5A5A5A5A;
static const size_t buff_guard = 2U;
static const size_t buff_length = 4U;
static const size_t buff_total = buff_length + buff_guard;

struct QueueFixture {

	struct Queue_t queue;
	Type buff[buff_total];

	QueueFixture() {
		memset(&buff[0U], 0x5A, buff_total * sizeof(Type));
		Queue_init(&queue, &buff[1U], buff_length, sizeof(Type));
	}
	~QueueFixture() {
		check_guards();
	}

	void check_guards() {
		/* Guards should not be touched. */
		BOOST_CHECK_EQUAL(buff[0U], init_val);
		BOOST_CHECK_EQUAL(buff[buff_total - 1U], init_val);

		/* These should be zero outside queue calls. */
	    BOOST_CHECK_EQUAL(queue.WLock, 0);
	    BOOST_CHECK_EQUAL(queue.RLock, 0);

		/* These should not be changed after initialization. */
	    BOOST_CHECK_EQUAL(queue.ItemSize, sizeof(Type));
	    BOOST_CHECK_EQUAL(queue.Buff, (uint8_t*)&buff[1U]);
	    BOOST_CHECK_EQUAL(queue.BufEnd, (uint8_t*)&buff[buff_length]);
	}

	void check_free(size_t i) {
		BOOST_CHECK_EQUAL(i, queue.Free);
	}

	void check_used(size_t i) {
		BOOST_CHECK_EQUAL(i, queue.Used);
	}

	void check_head(size_t i) {
		BOOST_CHECK_EQUAL(queue.Head, queue.Buff + i * queue.ItemSize);
	}

	void check_tail(size_t i) {
		BOOST_CHECK_EQUAL(queue.Tail, queue.Buff + i * queue.ItemSize);
	}

	void do_fill_queue_pushback() {
		for(size_t i = 0; i < buff_length; ++i) {
			Type val = i;
			BOOST_CHECK_EQUAL(Queue_pushback(&queue, &val), 1);
		}
	}
};

BOOST_FIXTURE_TEST_SUITE(Data_Queue, QueueFixture)

BOOST_AUTO_TEST_CASE(insanity_checks)
{
	/* Buff total should be equal to guards plus length.
	 * All bytes of the initial value should be initialized. */

	BOOST_CHECK_EQUAL(buff_total, buff_guard + buff_length);

	Type val;
	memset(&val, 0x5A, sizeof(val));
	BOOST_CHECK_EQUAL(init_val, val);
}

BOOST_AUTO_TEST_CASE(fixture_should_initialize_queue)
{
	/* Fixture should initialize queue.
	 * Fixture should initialize buffer. */

    BOOST_CHECK_EQUAL(queue.ItemSize, sizeof(Type));
    BOOST_CHECK_EQUAL(queue.Free, buff_length);
    BOOST_CHECK_EQUAL(queue.Used, 0);
    BOOST_CHECK_EQUAL(queue.WLock, 0);
    BOOST_CHECK_EQUAL(queue.RLock, 0);
    BOOST_CHECK_EQUAL(queue.Head, (uint8_t*)&buff[1U]);
    BOOST_CHECK_EQUAL(queue.Tail, (uint8_t*)&buff[1U]);
    BOOST_CHECK_EQUAL(queue.Buff, (uint8_t*)&buff[1U]);
    BOOST_CHECK_EQUAL(queue.BufEnd, (uint8_t*)&buff[buff_length]);

	for(size_t i = 0; i < buff_total; ++i)
		BOOST_CHECK_EQUAL(init_val, buff[i]);
}

BOOST_AUTO_TEST_CASE(pushback_should_succeed_if_not_full)
{
	/* Should succeed if queue is not full.
	 * Should fail if queue is full. */

	Type val;
	size_t i;

	for(i = 0; i < buff_length; ++i)
	{
		val = i;
		BOOST_CHECK_EQUAL(Queue_pushback(&queue, &val), 1);

		check_free(buff_length - (1U + i));
		check_used(1U + i);
		check_head(0U);
		check_tail((i + 1U) % buff_length);
	}

	val = i;
	BOOST_CHECK_EQUAL(Queue_pushback(&queue, &val), 0);
}

BOOST_AUTO_TEST_CASE(pushfront_should_succeed_if_not_full)
{
	/* Should succeed if queue is not full.
	 * Should fail if queue is full. */

	Type val;
	size_t i;

	for(i = 0; i < buff_length; ++i)
	{
		val = i;
		BOOST_CHECK_EQUAL(Queue_pushfront(&queue, &val), 1);

		check_free(buff_length - (1U + i));
		check_used(1U + i);
		check_head(buff_length - (i + 1U));
		check_tail(0U);
	}

	val = i;
	BOOST_CHECK_EQUAL(Queue_pushfront(&queue, &val), 0);
}

BOOST_AUTO_TEST_CASE(popfront_should_succeed_if_not_empty)
{
	/* Should fail if queue is empty.
	 * Should not change value when fail.
	 * Should succeed if queue is not full. */

	Type val;

	val = init_val;
	BOOST_CHECK_EQUAL(Queue_popfront(&queue, &val), 0);
	BOOST_CHECK_EQUAL(val, init_val);

	do_fill_queue_pushback();

	for(size_t i = 0; i < buff_length; ++i)
	{
		BOOST_CHECK_EQUAL(Queue_popfront(&queue, &val), 1);
		BOOST_CHECK_EQUAL(val, i);

		check_free(1U + i);
		check_used(buff_length - (1U + i));
		check_head((i + 1U) % buff_length);
		check_tail(0U);
	}

	val = init_val;
	BOOST_CHECK_EQUAL(Queue_popfront(&queue, &val), 0);
	BOOST_CHECK_EQUAL(val, init_val);
}

BOOST_AUTO_TEST_CASE(popback_should_succeed_if_not_empty)
{
	/* Should fail if queue is empty.
	 * Should not change value when fail.
	 * Should succeed if queue is not full. */

	Type val;

	val = init_val;
	BOOST_CHECK_EQUAL(Queue_popback(&queue, &val), 0);
	BOOST_CHECK_EQUAL(val, init_val);

	do_fill_queue_pushback();

	for(size_t i = 0; i < buff_length; ++i)
	{
		BOOST_CHECK_EQUAL(Queue_popback(&queue, &val), 1);
		BOOST_CHECK_EQUAL(val, buff_length - (i + 1U));

		check_free(1U + i);
		check_used(buff_length - (1U + i));
		check_head(0U);
		check_tail(buff_length - (1U + i));
	}

	val = init_val;
	BOOST_CHECK_EQUAL(Queue_popback(&queue, &val), 0);
	BOOST_CHECK_EQUAL(val, init_val);
}

BOOST_AUTO_TEST_CASE(functions_length_used_free)
{
	/* Should return the expected values. */

	BOOST_CHECK_EQUAL(Queue_length(&queue), buff_length);
	BOOST_CHECK_EQUAL(Queue_used(&queue), 0U);
	BOOST_CHECK_EQUAL(Queue_free(&queue), buff_length);

	BOOST_CHECK_EQUAL(Queue_empty(&queue), 1U);
	BOOST_CHECK_EQUAL(Queue_full(&queue), 0U);

	for(size_t i = 0; i < buff_length; ++i)
	{
		Type val = i;
		BOOST_CHECK_EQUAL(Queue_pushback(&queue, &val), 1U);

		BOOST_CHECK_EQUAL(Queue_length(&queue), buff_length);
		BOOST_CHECK_EQUAL(Queue_used(&queue), (1U + i));
		BOOST_CHECK_EQUAL(Queue_free(&queue), buff_length - (1U + i));

		if(i < buff_length - 1U)
		{
			BOOST_CHECK_EQUAL(Queue_empty(&queue), 0U);
			BOOST_CHECK_EQUAL(Queue_full(&queue), 0U);
		}
		else
		{
			BOOST_CHECK_EQUAL(Queue_empty(&queue), 0U);
			BOOST_CHECK_EQUAL(Queue_full(&queue), 1U);
		}
	}
}



BOOST_AUTO_TEST_SUITE_END()
