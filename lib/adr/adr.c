/*
 * The MIT License
 *
 * Copyright 2016 Anthony Campbell.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <jni.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>
#include <getopt.h>
#include "hidrd/util/str.h"
#include "hidrd/util/fd.h"
#include "hidrd/fmt.h"

const char *input_name = "temp.xml";
const char *output_name = "temp.c";
const char *input_fmt_name = "xml";
const char *output_fmt_name = "code";
const hidrd_fmt *input_fmt = "xml";
const hidrd_fmt *output_fmt = "code";

int convertXmlToCode() {

    input_fmt = hidrd_fmt_list_lkp(input_fmt_name);
    output_fmt = hidrd_fmt_list_lkp(output_fmt_name);

    return 1;
}
