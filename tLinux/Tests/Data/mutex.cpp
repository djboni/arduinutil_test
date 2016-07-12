#include <boost/test/unit_test.hpp>
#include "Data/mutex.h"
#include <cstring>

struct MutexFixture {

    struct Mutex_t mutex;

    MutexFixture() {
        Mutex_init(&mutex);
    }
    ~MutexFixture() {

    }
};

BOOST_FIXTURE_TEST_SUITE(Data_Mutex, MutexFixture)

BOOST_AUTO_TEST_CASE(lock_should_succeed_when_unlocked)
{
    /* Should succeed when unlocked.
     * Should fail when locked. */

    BOOST_CHECK_EQUAL(Mutex_lock(&mutex), 1U);
    BOOST_CHECK_EQUAL(Mutex_lock(&mutex), 0U);
}

BOOST_AUTO_TEST_CASE(unlock_should_succeed_when_locked)
{
    /* Should succeed when locked.
     * Should fail when unlocked*/

    BOOST_CHECK_EQUAL(Mutex_unlock(&mutex), 0U);

    BOOST_CHECK_EQUAL(Mutex_lock(&mutex), 1U);
    BOOST_CHECK_EQUAL(Mutex_unlock(&mutex), 1U);

    BOOST_CHECK_EQUAL(Mutex_unlock(&mutex), 0U);
}

BOOST_AUTO_TEST_SUITE_END()
