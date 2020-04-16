#!/usr/bin/env python

#Author 1000 rym.
import os

def createReportFile(fileName):
	#Add test Script Path#
	f = open(fileName, 'w')
	f.close()

if __name__ == '__main__':
	createReportFile("test_report.txt")