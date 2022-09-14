SELECT description FROM crime_scene_reports
WHERE month = 7 AND day = 28
AND street = "Humphrey Street"
-- 3 interviews : Ruth, Raymond and Eugene
SELECT transcript FROM interviews
WHERE month = 7 AND day = 28 AND year = 2021

--Ruth's clue
SELECT name FROM people
JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
WHERE bakery_security_logs.year = 2021
AND bakery_security_logs.month = 7
AND bakery_security_logs.day = 28
AND bakery_security_logs.hour = 10
AND bakery_security_logs.minute = >=15
AND bakery_security_logs.minute = <=25
AND bakery_security_logs.activity = 'exit'
ORDER BY bakery_security_logs.minute
--SUSPECTS: VENESSA, BRUCE, BARRY, LUCA, SOFIA, IMAN, DIANA,KELSEY

--Eugene's Clue
SELECT account_number FROM atm_transactions
WHERE atm_location = "Leggett Street" AND year = 2021 AND month = 7 AND day = 28
AND transaction_type = "withdraw"

SELECT name FROM people
JOIN bank_accounts ON bank_accounts.person_id = people.id
JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE year = 2021 AND month = 7 AND day = 28
AND atm_location = "Leggett Street"
AND transaction_type = "withdraw"
-- SUSPECTS:BRUCE DIANA LUCA IMAN

-- RAYMOND's clue
SELECT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.caller
WHERE year = 2021 AND month = 7 AND day = 28
AND duration <= 60

SELECT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.receiver
WHERE year = 2021 AND month = 7 AND day = 28
AND duration <= 60

SELECT destination_airport_id FROM flights
WHERE year = 2021 month = 7 day = 29
ORDER BY hour, minute

SELECT full_name, city FROM airports
WHERE airports.id = 4

SELECT name FROM people
JOIN passengers ON people.passport_number = passengers.passport_number
JOIN flights ON flights.id = passengers.flight_id
WHERE destination_airport_id = 4
AND year = 2021 AND month = 7 AND day = 29

SELECT phone_number FROM people
WHERE name = "Bruce"

SELECT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.receiver
WHERE year = 2021 AND month = 7 AND day = 28
AND duration <= 60
AND phone_calls.caller = "(367) 555-5533"

The THIEF is: BRUCE
The city the thief ESCAPED TO: NEW YORK
The ACCOMPLICE is: ROBIN
