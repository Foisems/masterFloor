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
using MasterFloor.ViewModel;

namespace MasterFloor.View
{
    /// <summary>
    /// Логика взаимодействия для PartnerList.xaml
    /// </summary>
    public partial class PartnerList : Window
    {
        public PartnerList()
        {
            InitializeComponent();
        }

        private void PartnersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
             var selectedPartner = PartnersListView.SelectedItem
                                              as PartnerItem;
            if (selectedPartner != null)
            {
                var partnerWindow = new PartnerEdit(selectedPartner.partner);
                partnerWindow.ShowDialog();
                PartnersListView.SelectedItem = null; // Сброс выделения
            }
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            PartnerViewModel dataContext = this.DataContext as PartnerViewModel;
            if (dataContext != null) { 
                dataContext.LoadPartners();
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var partnerWindow = new PartnerEdit(null);
            partnerWindow.ShowDialog();
        }
    }
}
