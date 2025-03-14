-- +goose Up
-- +goose StatementBegin

CREATE TABLE users
(
    id         character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name  character varying,
    email      character varying NOT NULL,
    password   character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,

    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin

DROP TABLE users;

-- +goose StatementEnd
