/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> } 
 */
exports.seed = async function(knex) {
  // Deletes ALL existing entries
  await knex('users').del()
  await knex('users').insert([
    {id: 1, name: 'Marty EVUORT', email: 'marty.evuort@uci.edu'},
    {id: 2, name: 'Ryan SEBBANE', email: 'ryan.sebbane@efrei.net'},
    {id: 3, name: 'Morgan SENECHAL', email: 'morgan.senechal@efrei.net'}
  ]);
};
