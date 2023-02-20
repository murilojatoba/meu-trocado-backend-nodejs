import { Knex } from "knex";

export async function up(knex: Knex): Promise<void> {
    return knex.schema.createTable('user_type', function (table) {
        table.increments('id').primary();
        table.string('description', 100).notNullable();
        table.boolean('isAdmin').notNullable().defaultTo(false);
        table.boolean('isActive').notNullable().defaultTo(true);
    });
}

export async function down(knex: Knex): Promise<void> {
    return knex.schema.dropTable('user_type');
}

