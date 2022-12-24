WITH round_entries AS
(
    SELECT matches.round_id, entries.pokemon_id, entries.match_id
    FROM match_entries entries
    INNER JOIN matches
    ON entries.match_id = matches.match_id
)
SELECT JSONB_AGG(JSONB_BUILD_OBJECT(
    'linkStart', curr.match_id,
    'linkEnd', nxt.match_id))
FROM round_entries curr
INNER JOIN round_entries nxt
ON curr.round_id + 1 = nxt.round_id AND curr.pokemon_id = nxt.pokemon_id