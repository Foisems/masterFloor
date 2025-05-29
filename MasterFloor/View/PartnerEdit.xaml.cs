using MasterFloor.Model;
using MasterFloor.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для PartnerEdit.xaml
    /// </summary>
    public partial class PartnerEdit : Window
    {
        List<PartnerType> publicTypes = new List<PartnerType>();
        List<Address> publicAddresses = new List<Address>();
        List<Person> publicPersons = new List<Person>();
        Partners currentPartnter= null;
        Address currentAddress=null;
        Person currentPerson=null;
        PartnerType currentPartnerTypes = null;
        bool isEdit=false;
        public PartnerEdit(Partners partner)
        {
            InitializeComponent();
            using (var db = new masterFloorEntities2())
            {
                typeCombo.Items.Clear();
                var types = db.PartnerType.ToList();
                publicPersons = db.Person.ToList();
                publicAddresses = db.Address.ToList();
                foreach (var type in types)
                {
                    typeCombo.Items.Add(type.Name);
                    publicTypes.Add(type);
                }
            }
            if (partner != null)
            {
                isEdit = true;
                innTB.IsEnabled = false;
            }
            else
            { editButton.Content = "Создать"; }
            if (isEdit)
            {
                currentPartnter = partner;
                foreach (var item in typeCombo.Items)
                {
                    if (item.ToString() == partner.PartnerType.Name)
                    {
                        typeCombo.SelectedIndex = typeCombo.Items.IndexOf(item);
                        break;
                    }
                }
                foreach (var address in publicAddresses)
                {
                    if (address.Id == partner.AddressId)
                    {
                        currentAddress = address;
                        postNumberTB.Text = address.PostNumber;
                        regionTB.Text = address.RegionName;
                        cityTB.Text = address.CityName;
                        streetTB.Text = address.StreetName;
                        homeNumberTB.Text = address.HomeNumber.ToString();
                        break;
                    }
                }
                foreach (var director in publicPersons)
                {
                    if (director.Id == partner.DirectorId)
                    {
                        currentPerson = director;
                        directorNameTB.Text = director.Name;
                        directorLastnameTB.Text = director.LastName;
                        surnameTB.Text = director.Surname;
                        break;
                    }
                }

                nameTB.Text = partner.Name;
                ratingTB.Text = partner.Rating.ToString();
                phoneTB.Text = partner.Phone.ToString();
                emailTB.Text = partner.Email.ToString();
                innTB.Text = partner.INN.ToString();
            }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(nameTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Название'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                nameTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(ratingTB.Text)| !ratingTB.Text.All(char.IsDigit))
            {
                MessageBox.Show("Не верно заполнено поле 'Рейтинг'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                ratingTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(postNumberTB.Text)|!postNumberTB.Text.All(char.IsDigit))
            {
                MessageBox.Show("Не верно заполнено поле  'Почтовый индекс'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                postNumberTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(regionTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Регион'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                regionTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(cityTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Город'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                cityTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(streetTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Улица'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                streetTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(homeNumberTB.Text) | (!homeNumberTB.Text.All(char.IsDigit)))
            {
                MessageBox.Show("Не верно заполнено поле  'Номер дома'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                homeNumberTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(directorNameTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Имя директора'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                directorNameTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(directorLastnameTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Фамилия директора'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                directorLastnameTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(surnameTB.Text))
            {
                MessageBox.Show("Не заполнено поле 'Фамилия'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                surnameTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(phoneTB.Text) )
            {
                MessageBox.Show("Не верно заполнено поле 'Телефон'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                phoneTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(emailTB.Text) | !emailTB.Text.Contains("@"))
            {
                MessageBox.Show("Не верно заполнено поле  'Email'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                emailTB.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(innTB.Text) | !(innTB.Text.Length==11)|(!innTB.Text.All(char.IsDigit)))
            {
                MessageBox.Show("Не верно заполнено поле  'ИНН'", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                innTB.Focus();
                return;
            }

            if (typeCombo.SelectedIndex==-1)
            {
                MessageBox.Show("Не выбран тип партнёра", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                typeCombo.Focus();
                return;
            }

            if (isEdit)
            {
                try
                {
                    using (var db = new masterFloorEntities2())
                    {
                        currentPartnter.Name = nameTB.Text;
                        currentPartnter.Rating = Convert.ToInt32(ratingTB.Text);
                        currentPartnter.Phone = phoneTB.Text;
                        currentPartnter.Email = emailTB.Text;
                        currentPerson.Name = directorNameTB.Text;
                        currentPerson.Surname = surnameTB.Text;
                        currentPerson.LastName = directorLastnameTB.Text;
                        currentAddress.PostNumber = postNumberTB.Text;
                        currentAddress.RegionName = regionTB.Text;
                        currentAddress.CityName = cityTB.Text;
                        currentAddress.StreetName = streetTB.Text;
                        currentAddress.HomeNumber = Convert.ToInt32(homeNumberTB.Text);
                        currentPartnter.PartnerTypeId = publicTypes.FirstOrDefault((type) => type.Name == typeCombo.SelectedItem).Id;
                        db.Partners.AddOrUpdate(currentPartnter);
                        db.Address.AddOrUpdate(currentAddress);
                        db.Person.AddOrUpdate(currentPerson);
                        db.SaveChanges();
                        MessageBox.Show("Данные обновлены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        this.Close();
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Не удалось обновить данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else {
                try
                {
                    using (var db = new masterFloorEntities2())
                    {
                        
                            // Создаем новый адрес
                            var address = new Address
                            {
                                PostNumber = postNumberTB.Text.Trim(),
                                RegionName = regionTB.Text.Trim(),
                                CityName = cityTB.Text.Trim(),
                                StreetName = streetTB.Text.Trim(),
                                HomeNumber = Convert.ToInt32(homeNumberTB.Text)
                            };
                            db.Address.Add(address);

                            // Создаем новую персону (директора)
                            var person = new Person
                            {
                                Name = directorNameTB.Text.Trim(),
                                Surname = surnameTB.Text.Trim(),
                                LastName = directorLastnameTB.Text.Trim()
                            };
                            db.Person.Add(person);

                        // Создаем нового партнера
                        var partner = new Partners
                        {
                            Name = nameTB.Text.Trim(),
                            Rating = Convert.ToInt32(ratingTB.Text),
                            Phone = phoneTB.Text.Trim(),
                            Email = emailTB.Text.Trim(),
                            PartnerTypeId = publicTypes.FirstOrDefault(type => type.Name == typeCombo.SelectedItem.ToString())?.Id ?? 0,
                            INN = innTB.Text,
                                Address = address,
                            Person = person
                        };
                            db.Partners.Add(partner);

                            db.SaveChanges();
                            MessageBox.Show("Партнёр создан", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                            this.Close();
                        
                    }
                }
                catch (Exception error)
                {
                    MessageBox.Show(error.Message.ToString());
                    MessageBox.Show("Не удалось создать партнёра", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            ProductsHistory productsHistory = new ProductsHistory(currentPartnter);
            productsHistory.ShowDialog();
            
        }

        private void Window_Activated(object sender, EventArgs e)
        {
        }
    }
} 
