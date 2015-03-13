SELECT sec_persona_ins(
    1,
    15322865,
    5,
    1,
    'pedro',
    'pablo',
    'picapiedra',
    'marmol',
    'piedra dura 123'
);
<--- retorna un bingit 1 

select * from persona

select * from persona, users, pais
where persona.user_id = users.id and
      persona.pais = pais.id
