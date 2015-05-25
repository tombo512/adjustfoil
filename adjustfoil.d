/+

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

+/

import std.stdio,
	   std.file,
	   std.string,
	   std.conv;

void main() {
target: 
	write("\nFile open: ");
	auto filename = chomp(readln());	//define a file.
	if(exists(filename)){		//check file name.
		}else{
			writeln("Error: file can not be opend");
target2: 
			write("Continue? (y/n): ");
			string ans;
			ans = chomp(readln());
			if(ans == "y"){
				goto target;
			}else if(ans == "n"){
				return;
			}else{
				writeln("Error: unexpected input");
				goto target2;
			}
		}
	{
		auto file = File(filename, "r");

//		write("\nSelect mode (a or b)\n - a ... cor")
		write("\nStart line (0 origin): ");
		int start = to!(int)(chomp(readln()));  //define the value start line.

		write("\nValue form: ");
		string form = chomp(readln());	//define the value form.
		string foilname = file.readln();	//get the foil name.

		for(int i = 0; i < start; i++){
			file.byLine.popFront();     // empty lines remove.
		}

		float x = void, y = void;
		float[] x_od, y_od;
		int count = 0,
			border,
			flag = 0;

		while (file.readf(form, &x, &y)){
			if(x == 1 && flag == 0){
				border = count;
				flag = 1;
			}
			x_od ~= x;
			y_od ~= y;
			file.byLine.popFront();     // 1 line remove.
			count++;	
		}

		float num1, num2;
		for(int i = 0; i < border/2; i++){
			num1 = x_od[i];
			x_od[i] = x_od[border - i];
			x_od[border - i] = num1;

			num2 = y_od[i];
			y_od[i] = y_od[border - i];
			y_od[border - i] = num2;
		}

		write("\nNew file name: ");
		auto newfilename = chomp(readln());	//define a file.

		{
			auto file2 = File(newfilename, "w");
			file2.writef(foilname);
			int k = 0;
			for(k = 0; k < x_od.length; k++){
				file2.writef(" %5f\t%5f\n", x_od[k], y_od[k]);	
			}

		writeln("\n...done \n");

		}
	}

target3: 
	write("Continue? (y/n): ");
	string ans;
	ans = chomp(readln());
	if(ans == "y"){
		goto target;
	}else if(ans == "n"){
		return;
	}else{
		write("Error: unexpected input");
		goto target3;
	}
}







