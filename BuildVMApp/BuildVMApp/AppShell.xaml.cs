using System;
using System.Collections.Generic;
using BuildVMApp.ViewModels;
using BuildVMApp.Views;
using Xamarin.Forms;

namespace BuildVMApp
{
    public partial class AppShell : Xamarin.Forms.Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(ItemDetailPage), typeof(ItemDetailPage));
            Routing.RegisterRoute(nameof(NewItemPage), typeof(NewItemPage));
        }

    }
}

