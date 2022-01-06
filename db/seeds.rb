# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
user1 = User.create!(
  email: "me@azerty.com",
  password: "azerty"
)
template1 = Template.create!(
  title: 'American History 1',
  description: 'American History 1776 - 1800',
  document:"path/to/doc.docx",
  creator: user1
)