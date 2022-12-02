Feature: Testando API Pokemon

Background: Executa uma vez antes de cada teste.
    * def url_base = 'https://pokeapi.co/api/v2'

Scenario: Testando o elemento type 3 na quarta posição do meu array[3]    
Given url url_base
And path '/type/3'
When method get
Then match response.game_indices[3].name = "generation-iv"

Scenario: Testando habilidade e armadura de um pokemon
Given url url_base
And path '/ability/battle-armor' 
When method get
Then match response.effect_entries[1].language.short_effect = "Protects against critical hits."

Scenario: testando url de pokemon api na posição 8.
Given url url_base
And path '/pokemon?limit=100000&offset=0'
When method get
Then macth response.results[7].url = "https://pokeapi.co/api/v2/pokemon/8/"

Scenario: testando url de pokemon api no item da posição 10000
Given url url_base
And path '/item/10000'
When method get
Then match response = "Not Found"    

Scenario: testando o text nipônico em flavor_text_entries[0]
Given url url_base
And path '/pokemon-species/aegislash'
When method get
Then match response.flavor_text_entries[0].flavor_text = "れきだいの　おうが　つれていた。 れいりょくで　ひとや　ポケモンの こころを　あやつり　したがわせる。"   

Scenario Outline: Criando um pokemon a partir do post
Given url url_base
And path '/post'
And request <request_json>
When method post
Then status 201
And match $.id = 100
And match $.name = '#string'
And match $.ability = '#string'
And match $.idade = '#number'
