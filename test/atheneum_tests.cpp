/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#include <gtest/gtest.h>
#include <atheneum/atheneum.h>

TEST(Atheneum, Example)
{
    Atheneum::Atheneum atheneum;
    EXPECT_EQ(atheneum.answer(), 42);
}

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);

    return RUN_ALL_TESTS();
}
