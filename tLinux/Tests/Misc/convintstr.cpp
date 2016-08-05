#include <boost/test/unit_test.hpp>
#include "Misc/convintstr.h"
#include <cstring>
using std::strcmp;

BOOST_AUTO_TEST_SUITE(Misc_convintstr)

BOOST_AUTO_TEST_CASE(digit2char_should_work)
{
    const char chlist[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'A', 'B', 'C', 'D', 'E', 'F'};
    const char chunknown = '?';

    int i;
    for(i = 0; i < 16; ++i)
        BOOST_CHECK_EQUAL(conv_digit2char(i), chlist[i]);
    for(i = 16; i < 256; ++i)
        BOOST_CHECK_EQUAL(conv_digit2char(i), chunknown);
}

BOOST_AUTO_TEST_CASE(ul2str_should_work)
{
    const uint8_t size = 10;
    char str[size];
    const uint8_t base = 10;
    uint32_t value = 0;

    char *ptr = conv_ul2str(str, size, value, base);

    BOOST_CHECK_EQUAL(ptr, &str[size - 2U]);
    BOOST_CHECK_EQUAL(strcmp(ptr, "0"), 0);

    value = 9;
    ptr = conv_ul2str(str, size, value, base);

    BOOST_CHECK_EQUAL(ptr, &str[size - 2U]);
    BOOST_CHECK_EQUAL(strcmp(ptr, "9"), 0);

    value = 11;
    ptr = conv_ul2str(str, size, value, base);

    BOOST_CHECK_EQUAL(ptr, &str[size - 3U]);
    BOOST_CHECK_EQUAL(strcmp(ptr, "11"), 0);

    value = 987654321;
    ptr = conv_ul2str(str, size, value, base);

    BOOST_CHECK_EQUAL(ptr, &str[size - 10U]);
    BOOST_CHECK_EQUAL(strcmp(ptr, "987654321"), 0);

    value = 1987654321;
    ptr = conv_ul2str(str, size, value, base);

    BOOST_CHECK_EQUAL(ptr, &str[size - 10U]);
    BOOST_CHECK_EQUAL(strcmp(ptr, "987654321"), 0);
}

BOOST_AUTO_TEST_SUITE_END()
