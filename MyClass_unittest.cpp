//
// Created by Sheridan C Rawlins on 6/15/18.
//
#include "MyClass.h"

#include <gtest/gtest.h>

namespace {
    class MyClassTest : public ::testing::Test {
    protected:
        MyClass myClass;
    };
}

TEST_F(MyClassTest, twice) {
    EXPECT_EQ(myClass.twice(2), 4);
}