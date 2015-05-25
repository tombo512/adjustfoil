/*

***************************
Adjustfoil Ver.0.0
翼型データベースから引っ張ってきた座標データをXflr5で認識できる形に直すというただそれだけのためのアプリケーション．

2015.5.19
ファイル名，データが始まる行，データ形式，新しく作成するファイル名を入力する仕様．
例外処理未実装．
(R.Hirota)

2015.5.22
例外処理実装．
(R.Hirota)
***************************

ToDo
- 例外処理 ...Done
- データ形式自動読み取り
- データ開始位置自動読み取り
- ファイル名自動生成（？）

- 最終的にShellコマンド化

*/

#include <stdio.h>
#include <stdlib.h>

#define MAX_INPUT_SIZE 100

int main(int argc, char const *argv[])
{
	FILE *file;
	char *filename;
target: 
	printf("\nFile open: ");
	fgets(filename, MAX_INPUT_SIZE, stdin);

	file = fopen(filename, "r");

	if(file == NULL){		//check file name.
		printf("Error: file can not be opend\n");
target2: 
		printf("Continue? (y/n): ");
		char *ans;
		fgets(ans, MAX_INPUT_SIZE, stdin);
		if(&ans == "y"){
			goto target;
		}else if(&ans == "n"){
			exit(0);
		}else{
			printf("Error: unexpected input\n");
			goto target2;
		}
	}

	printf("\nStart line (0 origin): ");
	char *input_start;
	fgets(input_start, MAX_INPUT_SIZE, stdin);
	long start = atol(input_start);		//define the value start line.

	printf("\nValue form: ");
	char *form;
	fgets(form, MAX_INPUT_SIZE, stdin);		//define the value form.

	char *foilname;
	fgets(foilname, MAX_INPUT_SIZE, file)		//get the foil name.

	fseek(file, start, SEEK_SET);     // set file direction.

	float x = void, y = void;
	float[] x_od, y_od;
	int count = 0,
		border,
		flag = 0;

	while (!feof(file){
		if(x == 1 && flag == 0){
			border = count;
			flag = 1;
		}
		x_od ~= x;
		y_od ~= y;
		fseek(file, 1, SEEK_CUR);     // 1 line remove.
		count++;	
	}



	while((c = fgetc(file)) != EOF){
		printf("%c", c);
	}

	fclose(file); 
	return 0;
}