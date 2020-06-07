//
//  HasPathInMatrix.m
//  MyStudy
//
//  Created by jolin on 2019/10/19.
//  Copyright © 2019年 jolin. All rights reserved.
//  回溯算法:

#import "HasPathInMatrix.h"

@implementation HasPathInMatrix

- (instancetype)init
{
    if (self = [super init]) {
        char matrix[][4] = {'a', 'b', 'f', 'g',
                            'c', 'f', 'c', 's',
                            'j', 'd', 'e', 'h'
                            };
        char * str = "bgsh";
        bool hasPathStr = hasPathInMatrix((char *)matrix, 3, 4, str);
        
        printf("\n---------- HasPathInMatrix ---------\n\n");
        printf("%s\n", hasPathStr ? "true" : "false");
        
        int count = totalMovingCountRobotCanArrive(12, 10, 10);
        printf("\n--- totalMovingCountRobotCanArrive ---\n\n");
        printf("%d\n", count);
    }
    return self;
}


#pragma mark - 矩阵中的路径
/**
 面试题12: 矩阵中的路径
 
    请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。
    路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。
    如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面
    的 3X4 的矩阵中包含一条字符串 "bfce" 的路径。但矩阵中不包含字符串 "abfb"
    的路径，因为字符串的第一个字符 b 占据了矩阵中的第一行第二个格子之后，路径
    不能再次进入这个格子。
 
 @param matrix 输入的二位数组
 @param rows 二维数组的行数
 @param columns 二维数组的列数
 @param str 带查找是否包含的字符串
 @return 返回是否包含的结果
 */
bool hasPathInMatrix(char * matrix, int rows, int columns, char * str)
{
    if (!matrix || rows < 1 || columns < 1 || !str) return false;
    
    int length = rows * columns;
    bool * visited = malloc(sizeof(bool) * length);
    memset(visited, 0, length);
    
    int pathLength = 0;
    
    // 在所有的行、列中查找是否符合条件
    for (int i = 0; i < rows; i ++) {
        for (int j = 0; j < columns; j ++) {
            if (hasPathCore(matrix, rows, columns, i, j, &pathLength, str, visited)) {
                free(visited);
                return true;
            }
        }
    }
    
    // 整个二位数组找完都没有符合条件的路径
    free(visited);
    return false;
}

bool hasPathCore(char * matrix, int rows, int columns, int row, int column, int * pathLength, char * str, bool * visited)
{
    // 待查找的内容已到末尾，表示前面的都已符合，即包含该路径，返回true
    if (str[*pathLength] == '\0') return true;
    
    bool hasPath = false;
    // 当前的行、列在给定范围内，并且当前位置的值等于对应路径中的值，并且当前路径的子路径没有访问过
    if (row >= 0 && row < rows && column >= 0 && column < columns && matrix[row * columns + column] == str[*pathLength] && !visited[row * columns + column]) {
        // 深度 + 1
        (*pathLength) ++;
        // 标记为当前位置已经访问过
        visited[row * columns + column] = true;
        
        // 按照当前位置的 上、下、左、右 方向查找是否符合条件
        hasPath = hasPathCore(matrix, rows, columns, row - 1, column, pathLength, str, visited) || hasPathCore(matrix, rows, columns, row, column - 1, pathLength, str, visited) || hasPathCore(matrix, rows, columns, row + 1, column, pathLength, str, visited) || hasPathCore(matrix, rows, columns, row, column + 1, pathLength, str, visited);
        // 4个方向都没有找到合适的，则退回上一个位置，并重置使用标记
        if (!hasPath) {
            // 深度 -1
            (*pathLength) --;
            // 重置为未使用
            visited[row * columns + column] = false;
        }
    }
    return hasPath;
}

#pragma mark - 机器人运动范围

/**
 面试题13: 机器人的运动范围
 
    地上有一个 m 行 n 列的方格。一个机器人从坐标 (0, 0) 的格子开始移动，它每次可以
    向左、右、上、下移动一格，但不能进入行坐标和列坐标的数位之和大于 k 的格子。例如，
    当 k 为 18 时，机器人能够进入方格 (35, 37), 因为 3+5+3+7=18. 但它不能进入
    方格 (35, 38)，因为 3+5+3+8=19. 请问该机器人能够到达多少个格子？

 @param threshold 机器人能够移动的阈值
 @param rows 总行数
 @param columns 总列数
 @return 返回机器人在阈值范围内能够移动的总格子数
 */
int totalMovingCountRobotCanArrive(int threshold, int rows, int columns)
{
    if (threshold < 0 || rows < 1 || columns < 1) return 0;
    
    int length = rows * columns;
    bool * counted = malloc(sizeof(bool) * length);
    memset(counted, 0, length);
    
    // 获取机器人能够移动的步数
    int totalCount = movingCount(threshold, rows, columns, 0, 0, counted);
    
    free(counted);
    return totalCount;
}

int movingCount(int threshold, int rows, int columns, int row, int column, bool * counted)
{
    int totalCount = 0;
    // 检测当前位置是否符合要求
    if (canRobotArrive(threshold, rows, columns, row, column, counted)) {
        // 将当前位置置为已计数过
        counted[row * columns + column] = true;
        // 总数等于:  1（当前位置）+ 上 + 左 + 下 + 右
        totalCount = 1 + movingCount(threshold, rows, columns, row - 1, column, counted) + movingCount(threshold, rows, columns, row, column - 1, counted) + movingCount(threshold, rows, columns, row + 1, column, counted) + movingCount(threshold, rows, columns, row, column + 1, counted);
    }
    return totalCount;

}

bool canRobotArrive(int threshold, int rows, int columns, int row, int column, bool * counted)
{
    // 检测行、列是否都在范围内，并且是没有计数过的
    if (row >= 0 && row < rows && column >= 0 && column < columns && !counted[row * columns + column]) {
        int rowBitSum = 0;
        int columnBitSum = 0;
        
        // 计算 row 的各位和
        while (row > 0) {
            rowBitSum += (row % 10);
            row = row / 10;
        }
        // 计算 column 的各位和
        while (column > 0) {
            columnBitSum += (column % 10);
            column = column / 10;
        }
        // 比较 row 的各位和 + column 各位和 是否 <= threshold
        if (rowBitSum + columnBitSum <= threshold) {
            return true;
        }
    }
    return false;
}

@end
