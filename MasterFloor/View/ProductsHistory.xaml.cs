using MasterFloor.Model;
using MasterFloor.ViewModel;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace MasterFloor.View
{
    /// <summary>
    /// Логика взаимодействия для ProductsHistory.xaml
    /// </summary>
    public partial class ProductsHistory : Window
    {
        public Partners publicPartner=null;
        public masterFloorEntities2 db = null;
        public ProductsHistory(Partners partner)
        {
            InitializeComponent();
            publicPartner = partner;
            HistoryViewModel historyViewModel = DataContext as HistoryViewModel;
            historyViewModel.LoadHistory(partner);
            TitleTextBlock.Text = "История продуктов партнера " + partner.PartnerType.Name + " " + partner.Name;
            db = masterFloorEntities2.GetContext();
            PartnersListView.ItemsSource = db.PartnerProduct.Where((item) => item.PartnerId == partner.Id).ToList();
            Address address = new Address
            {
                PostNumber = "1231321321",
                HomeNumber = 2,
                StreetName = "Улица Тестовая",
                CityName = "Город Тестовый",
                RegionName = "Регион Тестовый"
            };
            db.Address.Add(address);
            db.SaveChanges();

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }
    }
}
