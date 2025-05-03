*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://www.google.com
${BROWSER}   %{ROBOT_BROWSER}
${SEARCH_TERM}   Elon Musk

*** Test Cases ***
Search Elon Musk on Google
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name:q    timeout=10s

    # Input search term
    Input Text    name:q    ${SEARCH_TERM}

    # Submit search using JavaScript
    Execute Javascript    document.getElementsByName('q')[0].dispatchEvent(new KeyboardEvent('keydown', {'key': 'Enter'}))

    # Alternative: Click search button instead of pressing Enter
    # Click Button    xpath=//input[@name='btnK']

    # Assertion: Ensure search results are displayed
    Wait Until Page Contains    Elon Musk
    # Title Should Contain    Elon Musk
    Capture Page Screenshot

    Close Browser
