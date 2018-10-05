import matplotlib.pyplot as plt

def ParallelHistogram (name_lst,Label,data):
    x = list(range(len(name_lst)))
    n = len(Label) #種類個數
    total_width = 0.8 #所有長條的寬度和
    Width = total_width / n  #各個長條的寬度
    
    for i in range(n): #每次畫一種類的長條圖
        tmp_lst = data[i*len(x):(i+1)*len(x)]
            
        plt.bar(x, tmp_lst, width=Width, label=Label[i], tick_label = name_lst)
        # width: 該資料長條的寬度
        # label: 該種類標籤名字
        # tick_label: bar的標籤， 這個例子就是 Sun Mon Tue Wed Thu Fri Sat
        # fc(facecolor): 顏色
        for j in range(len(x)):  
            x[j] = x[j] + Width
     
    plt.legend()  # 顯示圖例
    plt.show() # 顯示圖像 
    
ParallelHistogram(['a','b','c'],['d','e'],[[1,2,3],[6,2,1]])