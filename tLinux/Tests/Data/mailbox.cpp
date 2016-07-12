#include <boost/test/unit_test.hpp>
#include "Data/mailbox.h"
#include <cstring>

struct MailboxFixture {

    struct Mailbox_t mailbox;

    MailboxFixture() {
        Mailbox_init(&mailbox);
    }
    ~MailboxFixture() {
    }
};

BOOST_FIXTURE_TEST_SUITE(Data_Mailbox, MailboxFixture)

BOOST_AUTO_TEST_CASE(fixture_should_initialize_mailbox)
{
    /* Fixture should initialize mailbox. */

    BOOST_CHECK_EQUAL(mailbox.Msg, (void*)NULL);
}

BOOST_AUTO_TEST_CASE(send_should_succeed_when_empty)
{
    /* Should succeed when empty.
     * Should fail when full.
     * Should keep the first message when fails. */

    void *msg1 = (void*)1;
    BOOST_CHECK_EQUAL(Mailbox_send(&mailbox, msg1), 1);
    BOOST_CHECK_EQUAL(mailbox.Msg, msg1);

    void *msg2 = (void*)2;
    BOOST_CHECK_EQUAL(Mailbox_send(&mailbox, msg2), 0);
    BOOST_CHECK_EQUAL(mailbox.Msg, msg1);
}

BOOST_AUTO_TEST_CASE(receive_should_succeed_when_full)
{
    /* Should fail when empty;
     * Should succeed when full.
     * Should return the sent message. */

    BOOST_CHECK_EQUAL(Mailbox_receive(&mailbox), (void*)NULL);

    void *msg1 = (void*)1;
    BOOST_CHECK_EQUAL(Mailbox_send(&mailbox, msg1), 1);
    BOOST_CHECK_EQUAL(Mailbox_receive(&mailbox), msg1);

    BOOST_CHECK_EQUAL(Mailbox_receive(&mailbox), (void*)NULL);
}

BOOST_AUTO_TEST_SUITE_END()
