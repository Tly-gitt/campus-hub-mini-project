ALTER TABLE posts DROP CHECK posts_chk_1;

ALTER TABLE posts
    ADD CONSTRAINT posts_chk_1
        CHECK (status IN ('PUBLISHED', 'REPORTED', 'RESOLVED', 'HIDDEN'));
