CREATE TABLE rating
(
  id           SERIAL      NOT NULL,
  rating       INT         NOT NULL DEFAULT 0,
  entity_class VARCHAR(50) NULL,
  entity_id    BIGINT      NOT NULL,
  user_id      BIGINT      NOT NULL,
  CONSTRAINT rating_pkey PRIMARY KEY (id),
  CONSTRAINT rating_user FOREIGN KEY (user_id)
  REFERENCES sec_user (id) MATCH SIMPLE
);