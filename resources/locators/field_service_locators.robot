*** Settings ***
Library    SeleniumLibrary
*** Variables ***  
${all_service_resource_page}    All Service Resources
${service_resource_tab}    xpath=//a[@title='Service Resources']/span
${automation}    Automation
${service_resources}    xpath=//span[@title='Service Resource Skills']
${related_tab}          xpath=//a[@id='relatedListsTab__item']
${new_button}    xpath=//div[starts-with(@class,"slds-align")]/div/ul[starts-with(@class,'branding')]/li/a/div[@title='New']
${skill_set_field}    xpath=//input[contains(@placeholder,'Search Skills')]
${start_date}     xpath=//label[@class='slds-form-element__label'][contains(text(),'Date')]/following-sibling::div/input[@name='EffectiveStartDate']  
${start_time}     xpath=//div[@class='slds-combobox_container']//div/div/div/div/input[@class='slds-combobox__input slds-input slds-combobox__input-value'][contains(@data-value,':')]
${save_btn}    xpath=//button[@class='slds-button slds-button_brand'][contains(text(),'Save')]    
${action_icon}    xpath=//a[@title='Show 2 more actions']
${delete_dorp_down_option}    xpath=//a[@title='Delete']
${delete_action}    xpath=//span[contains(text(),'Delete')]
${service_resource_skill_table_rows}    xpath=//table[@class='slds-table slds-table_header-fixed slds-table_bordered slds-table_edit slds-table_resizable-cols']//tbody/tr[2]
${service_resource_created_message}    xpath=//span[@class='toastMessage slds-text-heading--small forceActionsText']