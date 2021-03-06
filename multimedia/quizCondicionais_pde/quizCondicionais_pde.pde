Pergunta[] perguntas = new Pergunta[12];
int estado = 0, escolha = 0;
float ansBoxX1 = 216; //primeira coluna
float ansBoxX2 = 584; //segunda coluna
float ansBoxY1 = 360; //primeira linha
float ansBoxY2 = 498; //segunda coluna
float ansBoxWidth = 360;
float ansBoxHeight = 132;

void setup(){
  size(800,600);
  rectMode(CENTER);
  perguntas[0] = new Pergunta("Você está pronto para começar o quiz?"," "," "," ","Sim",4);
  perguntas[1] = new Pergunta("Caso um programador queira checar se um número é igual a outro, qual condicional ele deve usar?","For","Else","If","do",3);
  perguntas[2] = new Pergunta("O que acontece quando a condição expresssa em um if falha?","O programa salta para a proxima linha de código depois do if","O programa dá bug","O programa volta para a primeira linha do código","O programa não responde",1);
  perguntas[3] = new Pergunta("O que acontece quando não existe um else nem um else if imediatamente depois de um if?","Nada, o else não é necessário para o if funcionar","O programa pula até o else mais próximo","O programa pula até o else if mais próximo","O programa não funciona",1);
  perguntas[4] = new Pergunta("E quando não existe um if antes de um else?","Nada, o if não é necessário para o if funcionar", "O programa pula até o if mais próximo", "O programa pula até o else if mais próximo", "O programa não funciona",4);
  perguntas[5] = new Pergunta("Qual a condição necessário para um else ser executado?","Existir um if próximo","Existir um else if próximo", "Tanto a condiçao do if quando a do else if ser falsa","Apenas a condição do else if ser falsa",3);
  perguntas[6] = new Pergunta("Como são chamadas as estruturas de repetição?","While","Loops","Fruit Loops","Array",2);
  perguntas[7] = new Pergunta("Qual a principal diferença entre o while e o do...while?","Nenhuma","Com o do..while é garantido que o bloco de código irá ser executado pelo menos uma vez","A posição da condição de parada do laço","O contador",2);
  perguntas[8] = new Pergunta("Qual tipo de loop possui um contador interno","do..while","O laço de repetição","While","For",4);
  perguntas[9] = new Pergunta("Qual a estrutura de repetição mais indicada para percorrer arrays mais facilmente?","For","While","do..while","Nenhuma das alternativas",1);
  perguntas[10] = new Pergunta("Qual alternativa possui apenas estruturas de repetição?","do..while,for,while,if","Else,if, else if","else, for, while","do...while,for,while",4);
  perguntas[11] = new Pergunta("Parabéns, você terminou o quiz! Vá para a próxima parte ou então teste seus conhecimentos novamente!"," "," "," ","Refazer o Quiz",4);
  noStroke();
}


void draw(){
  background(200,230,201);
  textSize(40);
  fill(46,125,50);
  rect(width/2,30,width,60);
  fill(255);
  text("codeLearn Quiz",15,40);
  if((estado>0)&&(estado<11)){
    textSize(28);
    text("Pergunta No: " + estado,570,40);
  }
  fill(51,105,30);
  rect(width/2,height/2,width*0.85,height*0.7);
  fill(129,199,132);
  if((estado>0)&&(estado<11)){
    rect(ansBoxX1,ansBoxY1,ansBoxWidth,ansBoxHeight);
    rect(ansBoxX2,ansBoxY1,ansBoxWidth,ansBoxHeight);
    rect(ansBoxX1,ansBoxY2,ansBoxWidth,ansBoxHeight);
  }
  rect(ansBoxX2,ansBoxY2,ansBoxWidth,ansBoxHeight);
  fill(255);
  textSize(28);
  text(perguntas[estado].texto,width/2,height/2,width*0.85,height*0.7);
  textSize(18);
  fill(0);
  textAlign(CENTER, CENTER);
  text(perguntas[estado].alternativaA,ansBoxX1, ansBoxY1,ansBoxWidth,ansBoxHeight);
  text(perguntas[estado].alternativaB,ansBoxX2, ansBoxY1,ansBoxWidth,ansBoxHeight);
  text(perguntas[estado].alternativaC,ansBoxX1, ansBoxY2,ansBoxWidth,ansBoxHeight);
  text(perguntas[estado].alternativaD,ansBoxX2, ansBoxY2,ansBoxWidth,ansBoxHeight);
  textAlign(LEFT,LEFT);
}

void mousePressed(){
  if((((((mouseX>(ansBoxX1-ansBoxWidth*0.5) && mouseX <ansBoxX1+ansBoxWidth*0.5)&&(mouseY>(ansBoxX1-ansBoxHeight*0.5) && mouseY<ansBoxX2+ansBoxHeight*0.5))&&(perguntas[estado].resposta==1))||(((mouseX>(ansBoxX2-ansBoxWidth*0.5) && mouseX <ansBoxX2+ansBoxWidth*0.5)&&(mouseY>(ansBoxY1-ansBoxHeight*0.5) && mouseY<ansBoxY1+ansBoxHeight*0.5))&&(perguntas[estado].resposta==2)))||(((mouseX>(ansBoxX1-ansBoxWidth*0.5) && mouseX <ansBoxX1+ansBoxWidth*0.5)&&(mouseY>(ansBoxY2-ansBoxHeight*0.5) && mouseY<ansBoxY2+ansBoxHeight*0.5))&&(perguntas[estado].resposta==3)))||(((mouseX>(ansBoxX2-ansBoxWidth*0.5) && mouseX <ansBoxX2+ansBoxWidth*0.5)&&(mouseY>(ansBoxY2-ansBoxHeight*0.5) && mouseY<ansBoxY2+ansBoxHeight*0.5))&&(perguntas[estado].resposta==4))){ //Hitbox para (1,1)
     if (estado<11)
        estado++;
      else
        estado =0; 
   }
}

class Pergunta{
  String texto;
  String alternativaA;
  String alternativaB;
  String alternativaC;
  String alternativaD;
  int resposta;
  Pergunta (String texto,String alternativaA,String alternativaB,String alternativaC, String alternativaD,int resposta){
    this.texto = texto;
    this.alternativaA = alternativaA;
    this.alternativaB = alternativaB;
    this.alternativaC = alternativaC;
    this.alternativaD = alternativaD;
    this.resposta = resposta;
  }
}