﻿using _1714tfellerex2g;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace _1714tfellerex3b
{
   
    public partial class MainWindow : Window
    {
        PropertyManager2ModelContainer dbContext;
        System.Windows.Data.CollectionViewSource personViewSource;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            personViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("personViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            dbContext = new PropertyManager2ModelContainer();
            dbContext.People.Where(p => (p.Apartments1.Count > 0)).Load();
            personViewSource.Source = dbContext.People.Local;
            dbContext.Configuration.AutoDetectChangesEnabled = true;
        }

        private void firstButton_Click(object sender, RoutedEventArgs e)
        {
            personViewSource.View.MoveCurrentToFirst();
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            personViewSource.View.MoveCurrentToPrevious();
        }

        private void nextButton_Click(object sender, RoutedEventArgs e)
        {
            personViewSource.View.MoveCurrentToNext();
        }

        private void lastButton_Click(object sender, RoutedEventArgs e)
        {
            personViewSource.View.MoveCurrentToLast();
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            dbContext.SaveChanges();
        }
    }
}
