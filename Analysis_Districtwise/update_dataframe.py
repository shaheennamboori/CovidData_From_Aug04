def column_str_found(df):
    for i in df.columns:
        if df.dtypes[i] == object :
            return(i)


def update_file(data,file_path):
    sample = data
    continue_ = 'n'
    continue_ = input("Do you have to update the data  : (y/n)")
    print(type(file_path))
    print("hi")
    while(continue_ =='y'):
        print(" Options !!")
        print("\tAdd Column : c \n\tAdd row values : r")
        op = input("Enter your option")
        if op == 'c' :
            print("-------------------")
            print("Adding column")
            print("-------------------")
            column_name = input("Enter Column name : ")
            column_length = len(sample)
            print("Enter your entries {0} :".format("must be length of  "),len(sample))
            column = []
            for i in range(column_length):
                value = input()
                column.append(value)
            sample[column_name] = np.array(column)
            print(sample)
            save = input("Do you want to save changes (y/n): ")
            if save == 'y' : 
                data = sample
            continue_ = input("do you want to add more : (y/n)")
        if op == 'r' :
            print("-------------------")
            print("Adding row values")
            print("-------------------")
            row = {}
            d=[]
            i=0
            #finding the str type columns
            col = column_str_found(sample)
            for key in sample.columns:
                if key == col :
                    value = input("Enter {0} ".format(key))
                else :
                    value = int(input("Enter {0} ".format(key)))
                row.update({key:value})
                i = i+1
            d.append(row)    
            sample = sample.append(d,True)
            print(sample)
            save = input("Do you want to save these changes (y/n): ")
            if save == 'y' : 
                data = sample
                print(data)
            continue_ = input("do you want to add more : (y/n)")

    print("Final : ")
    print(data)
    final_save = input("Do you want to overwrite csv file : (y/n) ")
    if final_save == 'y':
        data.to_csv(file_path, index = True)
        print("Successully saved data")