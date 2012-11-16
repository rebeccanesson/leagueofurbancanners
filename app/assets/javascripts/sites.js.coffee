# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('.owner_id_class').change ->
    if $(".owner_id_class option:selected").val()
      console.log($(".owner_class"))
      $(".owner_class").attr "disabled", true
    else
      console.log($(".owner_id_class option:selected").val())
      $(".owner_class").removeAttr "disabled"
    
    
  $('.owner_class').change ->
    nonEmptyFields = (item for item in $(".owner_class") when item.value)
    console.log(nonEmptyFields)
    if nonEmptyFields.length > 0
      $(".owner_id_class").attr "disabled", true
    else 
      $(".owner_id_class").removeAttr "disabled"
  
  $('.secondary_owner_id_class').change ->
    if $(".secondary_owner_id_class option:selected").val()
      console.log($(".secondary_owner_class"))
      $(".secondary_owner_class").attr "disabled", true
    else
      console.log($(".secondary_owner_id_class option:selected").val())
      $(".secondary_owner_class").removeAttr "disabled"
      
      
  $('.secondary_owner_class').change ->
    nonEmptyFields = (item for item in $(".secondary_owner_class") when item.value)
    console.log(nonEmptyFields)
    if nonEmptyFields.length > 0
      $(".secondary_owner_id_class").attr "disabled", true
    else 
      $(".secondary_owner_id_class").removeAttr "disabled"
      
  $('.lurc_contact_id_class').change ->
    if $(".lurc_contact_id_class option:selected").val()
      console.log($(".lurc_contact_class"))
      $(".lurc_contact_class").attr "disabled", true
    else
      console.log($(".lurc_contact_id_class option:selected").val())
      $(".lurc_contact_class").removeAttr "disabled"


  $('.lurc_contact_class').change ->
    nonEmptyFields = (item for item in $(".lurc_contact_class") when item.value)
    console.log(nonEmptyFields)
    if nonEmptyFields.length > 0
      $(".lurc_contact_id_class").attr "disabled", true
    else 
      $(".lurc_contact_id_class").removeAttr "disabled"
      