1.What is PostgreSQL?
PostgresSql হলো একটি sql(Structured Query Language) ভিওিক open source RDMS(Relation Database management system) যা দিয়ে আমাদের কাঙ্কিত ডাটাগুলো সংরক্ষন করতে পারি।এটি আমাদের কিছু সিনটেক্স ডিফাইন করে দেয় যা দিয়ে আমরা আমাদের প্রয়োজন অনুযায়ী ডাটা পুনরুদ্ধার করে আমাদের প্রয়োজন মতো ব্যবহার করেতে পারি।

2.What is the purpose of a database schema in PostgreSQL?
Schema সাহায্যে আমরা একি ডাটাবেসে একি নামে ভিন্ন schema অধিনে বিভিন্ন টেবিল, ভিউ ,পাংশন রাখতে পারি যার ফলে একি নামের হওয়া পরেও একটির সাথে অন্যটির কনপ্লিক্ট হয় না। Schema মধ্যমে আমরা একসেস কন্ট্রোল করতে পারি আমরা ডিফাইন করে দিতে পারি কোন ইউজার কোন কোন schema একসেস করতে পারবে।

3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary key এর মধ্যমে আমরা একটি টেবিলের একটি কলাম কে ইউনিক ভাবে আইডেনটিপাই করতে পারি ।
যখন একটি টেবিলের primary key অন্য টেবিলে ব্যবহার করা হয় টেবিলগুলোর মধ্যে রিলেশন তৈরি করার জন্য তখন এটি কে Foreign Key বলা হয়।

4.What is the difference between the VARCHAR and CHAR data types?
VARCHAR এর মাধ্যমে নির্দিষ্ট লেন্থের মেমোরি স্পেস নিয়ে entity ডিফাইন করা হলে আমরা যদি সেই লেন্থের টেক্সট ইনফুট নাও দিয় যত সাইজের ইনফুট দেওয়া হবে সেটি ডাইনামিক ভাবে সে সাইজ নিয়ে নিবে এবং বাকি মেমোরি স্পেস ছেড়ে দিবে এর ফলে মেমোরির ব্যবহার আরো ভালো ভাবে করা নিশ্চিত  হয়।

CHAR এর(varchar) বিপরীত আচরন করে char এর মাধ্যমে নির্দিষ্ট লেন্থের মেমোরি স্পেস নিয়ে entity ডিফাইন করা হলে আমরা যদি সেই লেন্থের টেক্সট ইনফুট নাও দিয় যত মেমোরি স্পেস বা কেরেক্টার দিয়ে তাকে ডিফাইন করা হয়েছিল সে ততো টুকু স্পেস নিয়ে রাখবে উদাহরনের মাধ্যমে আরো ভালো ভাবে দেখতে পারি।
উদাহরনঃ

```sql
-- VARCHAR
CREATE TABLE test_varchar (
  name VARCHAR(10)
);
INSERT INTO test_varchar VALUES ('arman'); -- Stored as 'Tom';
---এখানের test_varchar ১০ স্পেস নিয়ে তৈরি করা হলেও যেহেতু আমি ১০ স্পেস কারেক্টার ব্যবহার করিনি তাই সে বাকি মেমোরি কে অন্য কাজের জন্য স্পেস দিয়ে দিবে।

-- CHAR
CREATE TABLE test_char (
  name CHAR(10)
);
INSERT INTO test_char VALUES ('arman'); -- Stored as 'arman       ' (with 5 spaces)
--এখানের ১০ দিয়ে ডিফাইন করার কারনে যত ইনফুট পাবে সেটি ফিলঅপ হওয়ার পর বাকি কারেক্টার গুলো স্পেস দিয়ে পূর্ণ করে দিবে মেমোরির স্পেস ছেড়ে দিবে না। 
```
8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN clause ব্যবহার করা হয় একটি টেবিলের সাথে অন্য একটি টেবিলের forign key এর মাধ্যমে যে রিলেশন তৈরি করা হয় সেটি কে ব্যবহার করে ডাটা পুনরুদ্ধার করার জন্য ।  
উদাহরনঃ
```sql
SELECT r.name, s.location
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id;
``` 

