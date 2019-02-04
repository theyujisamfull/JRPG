
# Projeto B: Role Playing Game

Vocês deverão fazer um jogo de RPG em turnos onde o jogador pode
controlar os personagens de sua equipe para combater monstros e outras
criaturas fantásticas.

O código base providenciado conta com um mínimo de funcionalidades de interação
para que vocês possam se concentrar mais nas funcionalidades de simulação.

Para este projeto, vocês deverão implementar uma série de mecânicas no jogo.
Sua nota será baseada na quantidade de mecânicas implementadas.

## Mecânicas para implementar

Cada mecânicas implementada vale meio (0,5) ponto, e você pode fazer quantas
conseguir (a soma total passa de dez). MAS várias mecânicas precisam que outras
mecânicas estejam funcionando antes.

### Personagens - OK

1. Criar tipo "Character" que possui vida máxima e vida atual e usar para
representar os heróis e os monstros.

2. Todo personagem começa com sua vida atual igual a sua máxima

3. A vida máxima de cada personagem é determinada no banco de dados

4. A barra de vida deve ser atualizada de acordo com a vida atual do respectivo
personagem

### Ataque - OK

**Requer [Personagens](#personagens)**

1. Fazer a ação de ataque reduzir a vida atual ("causar dano") do personagem
atacado

2. A redução deve ser por um valor fixo

### Morte - OK

**Requer [Ataque](#ataque)**

1. Fazer personagens com zero ou menos de vida atual serem excluídos do combate

2. Essa verficação deve ocorrer entre turnos

### Poder - OK

**Requer [Ataque](#ataque)**

1. Definir um atributo de poder (*power*) nos personagens

2. O poder de cada personagen é determinado no banco de dados

3. O poder influencia a quantidade de dano que um personagem causa com seu
   ataque

### Turno dos monstros - OK

1. Fazer a rodada de turnos incluir os monstros

2. Na vez de um monstro, empilhar um estado que vai decidir a ação dele

3. Monstros a princípio devem atacar heróis aleatoriamente

### Velocidade - OK

**Requer [Personagem](#personagem)**

1. Todo personagem tem uma atributo velocidade (*speed*)

2. A velocidade de cada personagem é definida no banco de dados

### Turnos por velocidade - OK

**Requer [Turno dos monstros](#turno-dos-monstros), [Velocidade](#velocidade)**

1. Todo personagem tem um contador de descanso (*cooldown*)

2. Para fazer uma ação, um personagem precisa ter 100 de descanso

3. No turno de um personagem, se ele não tem 100 de descanso, então ele acumula uma quantidade de descanso igual à sua velocidade e passa a vez

4. Ao executar uma ação, o personagem zera seu contador de descanso

5. [Referência](http://journal.stuffwithstuff.com/2014/07/15/a-turn-based-game-loop/)

### Derrota - OK

**Requer [Morte](#morte)**

1. Se todos os heróis morrerem, o jogador perde

2. Ao perder, deve aparecer uma tela de derrota

3. Ao apertar qualquer botão na tela de derrota, o jogo deve recomeçar

### Vitória - OK

**Requer [Morte](#morte)**

1. Se todos os monstros morrerem, o jogador vence o combate

2. Ao vencer, um novo time de monstros deve aparecer para desafiá-los

3. Todos os possíveis encontros (pelo menos 3) devem ser definidos no banco de
dados

4. A sequência de encontros que o jogador enfrenta também deve ser determinada
no banco de dados (em uma pasta "adventures").

### Energia - OK

**Requer [Personagens](#personagens)**

1. O tipo "Character" possui também energia máxima e energia atual

2. Todo personagem começa com sua energia atual igual a sua máxima

3. A energia máxima de cada personagem é determinada no banco de dados

### Barra de energia - Parcial

**Requer [Energia](#energia)**

1. Mostrar uma barra de energia assim como a barra de vida

2. A barra de energia deve ser atualizada de acordo com a energia atual do respectivo personagem


