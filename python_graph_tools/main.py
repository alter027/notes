import charts
def bef(k1,k2,l1,l2):
    # charts.stack_bar(k1,k2,l1,l2,filename='tri.png',title='triiiii')
    # charts.parrallel_bar(k1,k2,l1,l2,title='tri',filename='parrel.png')
    # charts.pie(k1,l1)
    # charts.bar(k1,l1)
    # charts.radar(k1,l1)

def main():
    l1 = [3,5,6,3,4]
    l2 = [7,2,3,4,2]
    k1 = ['a1','b2','c3','d4','e5']
    k2 = ['hee','dgg']
    item1 = [(i ,j)for i, j in zip(l1,l2)]
    item2 = [(j ,i)for i, j in zip(l1,l2)]
    print(l1)
    print(l2)
    print(item1)
    charts.line(k1,k2,item1,item2,filename='line.png')
    bef(k1,k2,l1,l2)
if __name__ == "__main__":
    main()