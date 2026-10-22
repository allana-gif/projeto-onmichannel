db.logs_navegacao.insertMany([
  {
    "cliente_id": 101,
    "data_hora": new Date("2026-10-22T14:00:00Z"),
    "pagina_visitada": "/produto/smartphone-galaxy-s23",
    "dispositivo": "Mobile",
    "acoes": ["pesquisou_item", "visualizou_detalhes"]
  },
  {
    "cliente_id": 102,
    "data_hora": new Date("2026-10-22T14:05:00Z"),
    "pagina_visitada": "/carrinho",
    "dispositivo": "Desktop",
    "acoes": ["adicionou_carrinho", "iniciou_checkout"]
  },
  {
    "cliente_id": 103,
    "data_hora": new Date("2026-10-22T14:10:00Z"),
    "pagina_visitada": "/categoria/eletronicos",
    "dispositivo": "Mobile",
    "acoes": ["filtrou_preco", "clicou_banner"]
  }
]);