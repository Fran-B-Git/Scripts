#!/usr/bin/env php
<?php

if ($argc < 2) {
    print_r('missing file');
    die;
}

$file = file_get_contents($argv[1]);
if (!$file) {
    die;
}
$clean = preg_replace('/\w+\((.*)\)(,*)/', '${1}${2}', $file);
$clean = preg_replace('/\+0000/', 'Z', $clean);
print_r($clean);
