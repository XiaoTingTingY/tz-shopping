package com.jkoss.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.RandomAccessFile;
import java.math.BigInteger;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 封装了些文件相关的操作
 */
public final class FileUtil {
	/**
	 * Buffer的大小
	 */
	private static Integer BUFFER_SIZE = 1024 * 1024 * 10;

	public static MessageDigest MD5 = null;

	static {
		try {
			MD5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException ne) {
			ne.printStackTrace();
		}
	}

	/**
	 * 获取文件的md5
	 * 
	 * @param file
	 * @return
	 */
	public static String fileMD5(File file) {
		FileInputStream fileInputStream = null;
		try {
			fileInputStream = new FileInputStream(file);
			byte[] buffer = new byte[8192];
			int length;
			while ((length = fileInputStream.read(buffer)) != -1) {
				MD5.update(buffer, 0, length);
			}
			return new BigInteger(1, MD5.digest()).toString(16);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (fileInputStream != null)
					fileInputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 获取文件的行数
	 *
	 * @param file
	 *            统计的文件
	 * @return 文件行数
	 */
	public final static int countLines(File file) {
		try (LineNumberReader rf = new LineNumberReader(new FileReader(file))) {
			long fileLength = file.length();
			rf.skip(fileLength);
			return rf.getLineNumber();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 以列表的方式获取文件的所有行
	 *
	 * @param file
	 *            需要出来的文件
	 * @return 包含所有行的list
	 */
	public final static List<String> lines(File file) {
		List<String> list = new ArrayList<>();
		try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
			String line;
			while ((line = reader.readLine()) != null) {
				list.add(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 以列表的方式获取文件的所有行
	 *
	 * @param file
	 *            需要处理的文件
	 * @param encoding
	 *            指定读取文件的编码
	 * @return 包含所有行的list
	 */
	public final static List<String> lines(File file, String encoding) {
		List<String> list = new ArrayList<>();
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), encoding))) {
			String line;
			while ((line = reader.readLine()) != null) {
				list.add(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 以列表的方式获取文件的指定的行数数据
	 *
	 * @param file
	 *            处理的文件
	 * @param lines
	 *            需要读取的行数
	 * @return 包含制定行的list
	 */
	public final static List<String> lines(File file, int lines) {
		List<String> list = new ArrayList<>();
		try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
			String line;
			while ((line = reader.readLine()) != null) {
				list.add(line);
				if (list.size() == lines) {
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 以列表的方式获取文件的指定的行数数据
	 *
	 * @param file
	 *            需要处理的函数
	 * @param lines
	 *            需要处理的行还俗
	 * @param encoding
	 *            指定读取文件的编码
	 * @return 包含制定行的list
	 */
	public final static List<String> lines(File file, int lines, String encoding) {
		List<String> list = new ArrayList<>();
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), encoding))) {
			String line;
			while ((line = reader.readLine()) != null) {
				list.add(line);
				if (list.size() == lines) {
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 在文件末尾追加一行
	 *
	 * @param file
	 *            需要处理的文件
	 * @param str
	 *            添加的字符串
	 * @param encoding
	 *            指定写入的编码
	 * @return 是否成功
	 */
	public final static boolean appendLine(File file, String str, String encoding) {
		String lineSeparator = System.getProperty("line.separator", "\n");
		try (RandomAccessFile randomFile = new RandomAccessFile(file, "rw")) {
			long fileLength = randomFile.length();
			randomFile.seek(fileLength);
			randomFile.write((lineSeparator + str).getBytes(encoding));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 将字符串写入到文件中
	 */
	public final static boolean write(File file, String str) {
		try (RandomAccessFile randomFile = new RandomAccessFile(file, "rw")) {
			randomFile.writeBytes(str);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 将字符串以追加的方式写入到文件中
	 */
	public final static boolean writeAppend(File file, String str) {
		try (RandomAccessFile randomFile = new RandomAccessFile(file, "rw")) {
			long fileLength = randomFile.length();
			randomFile.seek(fileLength);
			randomFile.writeBytes(str);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 将字符串以制定的编码写入到文件中
	 */
	public final static boolean write(File file, String str, String encoding) {
		try (RandomAccessFile randomFile = new RandomAccessFile(file, "rw")) {
			randomFile.write(str.getBytes(encoding));
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 将字符串以追加的方式以制定的编码写入到文件中
	 */
	public final static boolean writeAppend(File file, String str, String encoding) {
		try (RandomAccessFile randomFile = new RandomAccessFile(file, "rw")) {
			long fileLength = randomFile.length();
			randomFile.seek(fileLength);
			randomFile.write(str.getBytes(encoding));
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 快速清空一个超大的文件
	 *
	 * @param file
	 *            需要处理的文件
	 * @return 是否成功
	 */
	public final static boolean cleanFile(File file) {
		try (FileWriter fw = new FileWriter(file)) {
			fw.write("");
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 获取文件的Mime类型
	 *
	 * @param file
	 *            需要处理的文件
	 * @return 返回文件的mime类型
	 * @throws java.io.IOException
	 */
	public final static String mimeType(String file) throws java.io.IOException {
		FileNameMap fileNameMap = URLConnection.getFileNameMap();
		return fileNameMap.getContentTypeFor(file);
	}

	/**
	 * 获取文件最后的修改时间
	 *
	 * @param file
	 *            需要处理的文件
	 * @return 返回文件的修改时间
	 */
	public final static Date modifyTime(File file) {
		return new Date(file.lastModified());
	}

	/**
	 * 复制文件
	 *
	 * @param resourcePath
	 *            源文件
	 * @param targetPath
	 *            目标文件
	 * @return 是否成功
	 */
	public final static boolean copy(String resourcePath, String targetPath) {
		File file = new File(resourcePath);
		return copy(file, targetPath);
	}

	/**
	 * 复制文件 通过该方式复制文件文件越大速度越是明显
	 *
	 * @param file
	 *            需要处理的文件
	 * @param targetFile
	 *            目标文件
	 * @return 是否成功
	 */
	public final static boolean copy(File file, String targetFile) {
		try (FileInputStream fin = new FileInputStream(file);
				FileOutputStream fout = new FileOutputStream(new File(targetFile))) {
			FileChannel in = fin.getChannel();
			FileChannel out = fout.getChannel();
			// 设定缓冲区
			ByteBuffer buffer = ByteBuffer.allocate(BUFFER_SIZE);
			while (in.read(buffer) != -1) {
				// 准备写入，防止其他读取，锁住文件
				buffer.flip();
				out.write(buffer);
				// 准备读取。将缓冲区清理完毕，移动文件内部指针
				buffer.clear();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 创建多级目录
	 *
	 * @param paths
	 *            需要创建的目录
	 * @return 是否成功
	 */
	public final static boolean createPaths(String paths) {
		File dir = new File(paths);
		return !dir.exists() && dir.mkdir();
	}

	/**
	 * 创建文件支持多级目录
	 *
	 * @param filePath
	 *            需要创建的文件
	 * @return 是否成功
	 */
	public final static boolean createFiles(String filePath) {
		File file = new File(filePath);
		File dir = file.getParentFile();
		if (!dir.exists()) {
			if (dir.mkdirs()) {
				try {
					return file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	/**
	 * 删除一个文件
	 *
	 * @param file
	 *            需要处理的文件
	 * @return 是否成功
	 */
	public final static boolean deleteFile(File file) {
		return file.delete();
	}

	/**
	 * 快速的删除超大的文件
	 *
	 * @param file
	 *            需要处理的文件
	 * @return 是否成功
	 */
	public final static boolean deleteBigFile(File file) {
		return cleanFile(file) && file.delete();
	}

	/**
	 * 获取文件后缀名
	 * 
	 * @param file
	 * @return
	 */
	public final static String suffix(File file) {
		String fileName = file.getName();
		return fileName.substring(fileName.indexOf(".") + 1);
	}
}