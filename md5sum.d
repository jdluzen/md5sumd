import std.md5;
import std.stream;
int main(char[][] args) {
	//printf("%.*s\n", args[0]);
	if (args.length < 2) return 0;
	for (int i = 1;i<args.length;i++)
		MD5File(args[i]);
	return 0;
}
void MD5File(char[] file) {
	ubyte hash[16];
	MD5_CTX md;
	md.start();
	BufferedFile ifile = new BufferedFile(file);
	while (!ifile.eof()) {
		char buff[1024 * 4];
		int len = ifile.readBlock(buff, buff.length);
		md.update(buff[0 .. len]);
	}
	md.finish(hash);
	printf("%.*s = %.*s\n", file, digestToString(hash));
}
