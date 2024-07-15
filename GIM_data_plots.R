# Date: 7/15/2024
# Author: Julie Gonzalez
# Purpose: Visualize preliminary data collected from the Goat Island Marsh restoration site in Rush Ranch Open Space Preserve.

# Load packages
library(dplyr)
library(ggplot2)
library(scales)
library(tidyverse)
library(ggpubr)

#### TOPOGRAPHIC DATA ####

# read in data
topo_transects <- read.csv("GIM_topo_transects_features_table_20240715_JAG.csv")

#topo_transects$RID <- factor(topo_transects$RID, levels = c(" transect_1", "transect_2", "transect_3", "transect_4", "transect_5", "transect_6", "transect_7", "transect_8", "transect_9", "transect_10", "transect_11", "transect_12"))

topo_transect_levees <- topo_transects %>% 
  filter(Type=="Levee")

# plot all
d<-ggplot(data=topo_transects,aes(x=FMEAS,y=Elv_ft))
d<- d + geom_point() +
  geom_line() +
  scale_y_continuous(breaks = seq(0, 15, by=1)) +
  theme_bw() + 
  theme(axis.text.x = element_text(size=22),axis.text.y = element_text(size=22)) + 
  theme(axis.title.x = element_blank(), axis.title.y = element_text(size=24)) +
  theme(legend.text = element_text(size = 22), legend.title = element_text(size=24))+
  facet_grid(~RID, scales = "free")
show(d)
ggsave("Visuals/20231102_inundation_time.png", d, width=20, height=6, dpi=900)
ggsave("Visuals/20231102_inundation_time.eps", width = 12, height = 8, units = "in")

# plot only levee data
d<-ggplot(data=topo_transect_levees,aes(x=FMEAS,y=Elv_ft))
d<- d + geom_point() +
  geom_line() +
  scale_y_continuous(breaks = seq(0, 15, by=1)) +
  theme_bw() + 
  theme(axis.text.x = element_text(size=22),axis.text.y = element_text(size=22)) + 
  theme(axis.title.x = element_blank(), axis.title.y = element_text(size=24)) +
  theme(legend.text = element_text(size = 22), legend.title = element_text(size=24))+
  facet_grid(~RID, scales = "free")
show(d)
ggsave("Visuals/20231102_inundation_time.png", d, width=20, height=6, dpi=900)
ggsave("Visuals/20231102_inundation_time.eps", width = 12, height = 8, units = "in")