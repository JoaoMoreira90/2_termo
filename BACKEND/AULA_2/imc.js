// 1. importar a blibliotrca para ler os dados do terminal
const entrada = require('readline-sync');

console.log("----------------------------");
console.log("      CALCULADORA DE IMC");
console.log("----------------------------\n");

// 2. Coletar de dados (Entrada)
const nome = entrada.question("Qual o seu nome?");
const peso = entrada.questionFloat("Digite o seu peso (ex: 70.5): ");
const altura = entrada.questionFloat("Digite  sua altura (ex: 1.75): ");

// 3. Cálculo do IMC (processamento)
// A fórmula é: peso dividido por ( altura vezes altura)
const imc = peso / (altura * altura);

// 4. Exibicão do resultado (Salda)

console.log("\n------------------------")
console.log(`Olá, ${nome}!`);
console.log(`Seu peso: ${peso} kg`);
console.log(`Sua altura: ${altura} m`);

//tofixed (2) faz aparecer apenas 2 números após o ponto

console.log(`Seu IMC calculado é: ${imc.toFixed(2)}`);
console.log("---------------------------")
