CREATE TABLE "balance_histories" (
    id BIGSERIAL PRIMARY KEY,
    id_user VARCHAR(13) NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    mutation_type VARCHAR(50) NOT NULL,
    amount BIGINT NOT NULL,
    before_balance BIGINT NOT NULL,
    after_balance BIGINT NOT NULL,
    reference_type VARCHAR(100) NOT NULL,
    reference_id VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);