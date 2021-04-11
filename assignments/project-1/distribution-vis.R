library(ggplot2)
library(ggExtra)

# Put data into a data frame, put coordinates adjacent and name cols.
train <- read.csv('data/train.csv', header=FALSE)
train <- train[ ,c('V1', 'V2', 'V13', 'V3', 'V14', 'V4', 'V15', 'V5', 'V16', 
                   'V6', 'V17', 'V7', 'V18', 'V8', 'V19', 'V9', 'V20', 'V10', 
                   'V21', 'V11', 'V22', 'V12', 'V23')]
columns <- c('pose', 'head_x', 'head_y', 'chest_x', 'chest_y', 
             'r_elbow_x', 'r_elbow_y', 'r_hand_x', 'r_hand_y', 
             'l_elbow_x', 'l_elbow_y', 'l_hand_x', 'l_hand_y', 
             'hips_x', 'hips_y', 'r_knee_x', 'r_knee_y', 'r_foot_x', 
             'r_foot_y', 'l_knee_x', 'l_knee_y', 'l_foot_x', 'l_foot_y')
colnames(train) <- columns
train[train == 9999] <- NA

# Code to generate a scatter plot for the head coordinates of each pose
p <- ggplot(train, aes(x=head_x, y=head_y, colour = pose)) + 
      geom_point(alpha=0.5)
ggMarginal(p, groupColour=TRUE, groupFill=TRUE)

# QQ Plots
qqnorm(train[train$pose == 'bridge', 'chest_x'])
qqline(train[train$pose == 'bridge', 'chest_x'], col='red', lwd=2)
