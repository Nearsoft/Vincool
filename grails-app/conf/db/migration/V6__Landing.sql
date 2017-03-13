CREATE TABLE landing
(
  id               SERIAL NOT NULL,
  batch_id         BIGINT NOT NULL,
  version          BIGINT NOT NULL,
  show_instructors BOOLEAN     DEFAULT TRUE,
  show_next_events BOOLEAN     DEFAULT TRUE,
  show_full_batch  BOOLEAN     DEFAULT TRUE,
  main_color       VARCHAR(50) DEFAULT 'e54800',
  batch_html_info  TEXT,
  CONSTRAINT landing_pkey PRIMARY KEY (id),
  CONSTRAINT batch_id FOREIGN KEY (batch_id)
  REFERENCES public.batch (id) MATCH SIMPLE
);
