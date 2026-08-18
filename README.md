# gorest-robotframework

Robot Framework test suite for the [GoREST API](https://gorest.co.in/) Users endpoints.

## Prerequisites

- Python 3.x
- pip

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/jonathanmusila/gorest-robotframework.git
   cd gorest-robotframework
   ```

2. Create and activate a virtual environment:

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

## Running Tests

Run all tests:

```bash
robot tests/
```

Run a specific test file:

```bash
robot tests/users.robot
```

Run tests by tag:

```bash
robot --include smoke tests/
```

## Project Structure

```
├── resources/
│   ├── api/                  # API request definitions
│   ├── keywords/             # Reusable keyword implementations
│   └── variables/            # Test variables and configuration
├── tests/
│   └── users.robot           # User API test cases
├── requirements.txt
└── README.md
```
