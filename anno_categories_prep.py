import pandas as pd
import gzip as gz
import numpy as np
import re

path = '/cluster/home/jennm/annotation_extracts/'

# Kegg Ortholog data: listify, explode, clean, save
#KO_df = pd.read_csv(path+'KO_final.csv', header = 0, sep = '\t')
#KO_df['KO'] = KO_df['KO'].str.split(',')
#KO_df = KO_df.explode('KO').drop_duplicates(keep = 'first')
#KO_df.to_csv(path+'KO_exploded.csv')
#del KO_df

# Gene Ontology data: listify, explode, clean, save
#GO_df = pd.read_csv(path+'GO_final.csv', header = 0, sep = '\t')
#GO_df['GO'] = GO_df['GO'].str.split(',')
#GO_df = GO_df.explode('GO').drop_duplicates(keep = 'first')
#GO_df.to_csv(path+'GO_exploded.csv')
#del GO_df

# Cluster of Orthologous Groups data: extract COG term, clean, assemble, remove non-COGs, arCOG to COG, clean, save
COG_df = pd.read_csv(path+'COG_final.csv', header = 0, sep = '\t')
COG_list_df = np.array_split(COG_df, 500)
for i in range(0,len(COG_list_df)):
 COG_list_df[i]['COG'] = COG_list_df[i]['COG'].str.split('@').str[0]
 COG_list_df[i] = COG_list_df[i].drop_duplicates(keep = 'first')
COG_df = pd.concat(COG_list_df)
COG_df = COG_df[COG_df['COG'].str.contains('COG', na = False)]
COG_df['COG'] =COG_df['COG'].str.replace('arCOG', 'COG')
COG_df = COG_df.drop_duplicates(keep = 'first')
COG_df.to_csv(path+'COG_exploded.csv')
del COG_df
