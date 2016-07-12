#include <boost/test/unit_test.hpp>
#include "Data/semphr.h"
#include <cstring>

static const size_t count = 3U;

struct SemaphoreFixture {

    struct Semaphore_t semaphore;

    SemaphoreFixture() {
        Semaphore_init(&semaphore, count);
    }
    ~SemaphoreFixture() {
        BOOST_CHECK_EQUAL(semaphore.Max, count);
    }

    void check_count(size_t i) {
        BOOST_CHECK_EQUAL(semaphore.Count, i);
    }

    void do_unlockall() {
        while(Semaphore_unlock(&semaphore) != 0U) {}
    }
};

BOOST_FIXTURE_TEST_SUITE(Data_Semaphore, SemaphoreFixture)

BOOST_AUTO_TEST_CASE(fixture_should_initialize_semaphore)
{
    /* Fixture should initialize semaphore. */

    BOOST_CHECK_EQUAL(semaphore.Count, 0U);
    BOOST_CHECK_EQUAL(semaphore.Max, count);
}

BOOST_AUTO_TEST_CASE(initialize_binary_semaphore)
{
    /* Init binary should initialize semaphore with count and max to one. */

    Semaphore_initbinary(&semaphore);
    BOOST_CHECK_EQUAL(semaphore.Count, 0U);
    BOOST_CHECK_EQUAL(semaphore.Max, 1U);

    Semaphore_init(&semaphore, count); /* Undo modifications. */
}

BOOST_AUTO_TEST_CASE(unlock_should_succeed_when_not_full)
{
    /* Should succeed when not full. */

    check_count(0U);

    for(size_t i = 0; i < count; ++i)
    {
        BOOST_CHECK_EQUAL(Semaphore_unlock(&semaphore), 1U);

        check_count(i + 1U);
    }

    BOOST_CHECK_EQUAL(Semaphore_unlock(&semaphore), 0U);
}

BOOST_AUTO_TEST_CASE(lock_should_succeed_when_not_empty)
{
    /* Should succeed when not empty. */

    BOOST_CHECK_EQUAL(Semaphore_lock(&semaphore), 0U);
    check_count(0U);

    do_unlockall();
    check_count(count);

    for(size_t i = 0; i < count; ++i)
    {
        BOOST_CHECK_EQUAL(Semaphore_lock(&semaphore), 1U);

        check_count(count - (i + 1U));
    }

    BOOST_CHECK_EQUAL(Semaphore_lock(&semaphore), 0U);
    check_count(0U);
}

BOOST_AUTO_TEST_CASE(functions_getcount_getmax)
{
    /* Should return the expected values. */

    BOOST_CHECK_EQUAL(Semaphore_getcount(&semaphore), 0U);
    BOOST_CHECK_EQUAL(Semaphore_getmax(&semaphore), count);

    for(size_t i = 0; i < count; ++i)
    {
        Semaphore_unlock(&semaphore);

        BOOST_CHECK_EQUAL(Semaphore_getcount(&semaphore), (i + 1U));
        BOOST_CHECK_EQUAL(Semaphore_getmax(&semaphore), count);
    }
}

BOOST_AUTO_TEST_SUITE_END()
