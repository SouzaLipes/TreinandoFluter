
void main() {
// Criar uma lista de números inteiros
List<int> numeros = [10, 5, 3, 8, 2];
// Imprimir a lista original
print('Lista original: $numeros');
// Adicionar um número à lista
numeros.add(7);
print('Depois de adicionar 7: $numeros');
// Remover um número específico da lista
numeros.remove(5);
print('Depois de remover 5: $numeros');
// Ordenar a lista em ordem crescente
numeros.sort();
print('Lista ordenada: $numeros');
}