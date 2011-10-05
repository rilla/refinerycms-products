@corporate_pages
Feature: Corporate Pages
  In order to have corporate_pages on my website
  As an administrator
  I want to manage corporate_pages

  Background:
    Given I am a logged in refinery user
    And I have no corporate_pages

  @corporate_pages-list @list
  Scenario: Corporate Pages List
   Given I have corporate_pages titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of corporate_pages
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @corporate_pages-valid @valid
  Scenario: Create Valid Corporate Page
    When I go to the list of corporate_pages
    And I follow "Add New Corporate Page"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 corporate_page

  @corporate_pages-invalid @invalid
  Scenario: Create Invalid Corporate Page (without title)
    When I go to the list of corporate_pages
    And I follow "Add New Corporate Page"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 corporate_pages

  @corporate_pages-edit @edit
  Scenario: Edit Existing Corporate Page
    Given I have corporate_pages titled "A title"
    When I go to the list of corporate_pages
    And I follow "Edit this corporate_page" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of corporate_pages
    And I should not see "A title"

  @corporate_pages-duplicate @duplicate
  Scenario: Create Duplicate Corporate Page
    Given I only have corporate_pages titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of corporate_pages
    And I follow "Add New Corporate Page"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 corporate_pages

  @corporate_pages-delete @delete
  Scenario: Delete Corporate Page
    Given I only have corporate_pages titled UniqueTitleOne
    When I go to the list of corporate_pages
    And I follow "Remove this corporate page forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 corporate_pages
 