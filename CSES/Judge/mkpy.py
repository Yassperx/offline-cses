import requests
from bs4 import BeautifulSoup
from markdownify import markdownify as md

# Your CSES credentials
USERNAME = 'your_username'
PASSWORD = 'your_password'

# CSES login URL
LOGIN_URL = 'https://cses.fi/login'

# Session for handling cookies and maintaining login
session = requests.Session()

# Function to log in to CSES
def login(username, password):
    login_data = {
        'nick': username,
        'pass': password
    }
    session.post(LOGIN_URL, data=login_data)

# Function to get content of a specific problem and convert it to Markdown
def get_problem_content_as_markdown(problem_url):
    response = session.get(problem_url)
    soup = BeautifulSoup(response.text, 'lxml')

    # Find the content div
    content_div = soup.find('div', class_='content')

    if content_div:
        html_content = str(content_div)
        markdown_content = md(html_content)
        return markdown_content
    else:
        return "Content not found."

# Main script
def main():
    login(USERNAME, PASSWORD)
    
    # Specify the problem URL
    n = int(input())
    problem_url = f'https://cses.fi/problemset/task/{n}/'  # Replace with the specific problem URL
    
    content_markdown = get_problem_content_as_markdown(problem_url)
    
    print("Problem Content in Markdown:\n")
    print(content_markdown)

if __name__ == '__main__':
    main()

