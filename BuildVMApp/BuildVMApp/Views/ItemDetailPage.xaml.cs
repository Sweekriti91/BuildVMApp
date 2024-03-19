using System.ComponentModel;
using Xamarin.Forms;
using BuildVMApp.ViewModels;

namespace BuildVMApp.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}
