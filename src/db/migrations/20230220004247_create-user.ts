import { Knex } from "knex";

export async function up(knex: Knex): Promise<void> {
    return knex.schema.createTable('user', function (table) {
        table.bigIncrements('id').primary();
        table.string('first_name', 100).notNullable();
        table.string('last_name', 100).notNullable();
        table.date('birthday').nullable();
        table.string('email', 200).notNullable().unique();
        table.string('password', 50).nullable();
        table.string('google_id', 200).nullable();
        table.foreign('user_type', 'user_type_fk')
            .references('id').inTable('user_type')
            .notNullable();
        table.boolean('isActive').notNullable().defaultTo(true);
    });
}

export async function down(knex: Knex): Promise<void> {
    return knex.schema.dropTable('user');
}

