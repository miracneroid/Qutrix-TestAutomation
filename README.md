# Qutrix Test Automation Assignment

## Overview
This project contains automated test scripts developed using Robot Framework and Selenium for the Qutrix Automation Assessment.

## Features
- Automated IP Address Detection
- Selenium-based Browser Automation
- Automated Screenshot Capture
- Cross-platform Compatible Automation
- Structured Keyword-Driven Framework
- Execution Reporting

## Tech Stack
- Python
- Robot Framework
- SeleniumLibrary
- Chrome Browser

## Project Structure

Qutrix-TestAutomation/
│
├── resources/
├── tests/
├── screenshots/
├── reports/
├── requirements.txt
└── README.md

## Test Cases

### 1. IP Address Capture
- Detects operating system
- Captures machine IP address automatically
- Prints extracted IP

### 2. Qutrix Navigation Automation
- Opens qutrix.io
- Navigates to Careers workflow
- Opens Self-Assessment page
- Captures screenshot automatically

## Run Instructions

Install dependencies:

pip install -r requirements.txt

Run IP Automation:

python -m robot tests/ip_capture.robot

Run Selenium Automation:

python -m robot tests/qutrix_navigation.robot

## Output
Execution generates:
- report.html
- log.html
- output.xml
- Screenshot image

## Engineering Enhancements
- Reusable keyword-driven architecture
- Explicit waits for stability
- Dynamic browser automation handling
- Structured logging and reporting
- Cross-platform IP extraction support