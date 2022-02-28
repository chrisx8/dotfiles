#!/bin/bash

grep -v '^#' .env
export $(grep -v '^#' .env | xargs)
