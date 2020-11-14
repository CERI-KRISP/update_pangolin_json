import pandas as pd

json_df = pd.read_json('pangolin.json')
json_sequences=json_df.index.to_list()
print(json_df)



#print(json_sequences)

pangolin_assignment_df=pd.read_csv('Africa_set_Pangolin_4Nov.csv')
print(pangolin_assignment_df)

pangolin_sequences=pangolin_assignment_df['Sequence name'].to_list()
#print(pangolin_sequences)

for x in json_sequences:
    if x in pangolin_sequences:
        #print(x)
        correct_lineage=pangolin_assignment_df[pangolin_assignment_df['Sequence name']==x]['Lineage'].to_list()[0]
        lineage_string="{\"pangolin_lineage\": \""+correct_lineage+"\"}"
        #print(correct_lineage)
        json_df.loc[x,'nodes']=lineage_string

print(json_df)

json_df.to_json('edited_pangolin.json')
