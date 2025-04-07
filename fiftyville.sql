-- Keep a log of any SQL queries as you solve the mystery.

SELECT COUNT(*) as '# of Fiftyville Airports' FROM airports WHERE city = 'Fiftyville';

SELECT COUNT(*) as 'Interviews' FROM interviews WHERE year = 2024 AND month = 7 AND day = 28;

SELECT COUNT(*) as 'Number of Flights out of Fiftyville' FROM flights WHERE year = 2024 AND month = 7 AND day = 29 AND origin_airport_id IN
(
    SELECT id FROM airports WHERE city = 'Fiftyville'
)
;

--Finding the first flight

SELECT full_name
FROM flights JOIN airports
ON flights.destination_airport_id = airports.id
WHERE flights.origin_airport_id IN
(
    SELECT id FROM airports WHERE city = 'Fiftyville'
)
AND year = 2024
AND month = 7
AND day = 29
ORDER BY hour ASC, minute ASC
LIMIT 1;

--Passengers on the flight

SELECT name FROM people WHERE passport_number IN
(
    SELECT passport_number FROM passengers WHERE flight_id IN
    (
        SELECT id FROM flights
        WHERE year = 2024
        AND month = 7
        AND day = 29
        AND origin_airport_id IN
        (
            SELECT id FROM airports WHERE city = 'Fiftyville'
        )
        AND destination_airport_id IN
        (
            SELECT id FROM airports WHERE city = 'New York City'
        )
    )
);

--Now lets dig into the other interview information... what about ATM transactions?

SELECT name FROM people WHERE id IN
(
    SELECT person_id FROM bank_accounts WHERE account_number IN
    (
        SELECT account_number FROM atm_transactions
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND atm_location = 'Leggett Street'
        AND transaction_type = 'withdraw'
    )
)

AND passport_number IN
(
    SELECT passport_number FROM passengers WHERE flight_id IN
    (
        SELECT id FROM flights
        WHERE year = 2024
        AND month = 7
        AND day = 29
        AND origin_airport_id IN
        (
            SELECT id FROM airports WHERE city = 'Fiftyville'
        )
        AND destination_airport_id IN
        (
            SELECT id FROM airports WHERE city = 'New York City'
        )
    )
);

SELECT activity, hour, minute FROM bakery_security_logs WHERE year = 2024 AND month = 7 AND day = 28;

SELECT description FROM crime_scene_reports WHERE year = 2024 AND month = 7 AND day = 28;

SELECT name FROM people WHERE license_plate IN
(
    SELECT license_plate FROM bakery_security_logs
    WHERE activity = 'exit'
    AND hour = 10
    AND minute BETWEEN 15 and 25
)

AND id IN
(
    SELECT person_id FROM bank_accounts WHERE account_number IN
    (
        SELECT account_number FROM atm_transactions
        WHERE year = 2024
        AND month = 7
        AND day = 28
        AND atm_location = 'Leggett Street'
        AND transaction_type = 'withdraw'
    )
)

AND passport_number IN
(
    SELECT passport_number FROM passengers WHERE flight_id IN
    (
        SELECT id FROM flights
        WHERE year = 2024
        AND month = 7
        AND day = 29
        AND origin_airport_id IN
        (
            SELECT id FROM airports WHERE city = 'Fiftyville'
        )
        AND destination_airport_id IN
        (
            SELECT id FROM airports WHERE city = 'New York City'
        )
    )
)
AND phone_number IN
(
    SELECT caller FROM phone_calls
    WHERE year = 2024
    AND month = 7
    AND day = 28
);

-- BRUCE WAS THE THIEF!

SELECT name FROM people WHERE phone_number IN
(
    SELECT receiver FROM phone_calls
    WHERE year = 2024
    AND month = 7
    AND day = 28
    AND caller IN
    (
        SELECT phone_number FROM people WHERE name = 'Bruce'
    )
);

SELECT name, duration
FROM people JOIN phone_calls
ON people.phone_number = phone_calls.receiver
WHERE year = 2024
AND month = 7
AND day = 28
AND caller IN
(
    SELECT phone_number FROM people WHERE name = 'Bruce'
);
